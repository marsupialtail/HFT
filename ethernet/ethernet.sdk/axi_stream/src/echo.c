/*
 * Copyright (C) 2009 - 2019 Xilinx, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 */

#include <stdio.h>
#include <string.h>

#include "lwip/err.h"
#include "lwip/tcp.h"
#include "fsl.h"
#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif

//char buffer [32];
//volatile void * payload = buffer;
struct tcp_pcb *global_pcb;

int transfer_data() {
	uint val;
	void * payload = &val;
    int validity;
    getfsl(payload, 2);

    fsl_isinvalid(validity);
    //fsl_iserror(errority);

      if(validity == 0) {
            tcp_write(global_pcb, payload , 1, 1); //not sure how to get a tcp_pcb
      }
	return 0;
}

void print_app_header()
{
#if (LWIP_IPV6==0)
	xil_printf("\n\r\n\r-----lwIP TCP echo server ------\n\r");
#else
	xil_printf("\n\r\n\r-----lwIPv6 TCP echo server ------\n\r");
#endif
	xil_printf("TCP packets sent to port 6001 will be echoed back\n\r");
}

err_t recv_callback(void *arg, struct tcp_pcb *tpcb,
                               struct pbuf *p, err_t err)
{

	/* do not read the packet if we are not in ESTABLISHED state */
	if (!p) {
		tcp_close(tpcb);
		tcp_recv(tpcb, NULL);
		return ERR_OK;
	}
	/* indicate that the packet has been received */
	tcp_recved(tpcb, p->len);

	char buffer [32];
	void * payload = buffer;
	int validity = 1;
	int errority = 1;

	/* axi stream get and send 0,1 axis ports */

	        //u32_t var_axi;
	        //  void *payload = &var_axi;
	        //        getfslx(var_axi,0, FSL_DEFAULT);
	        u16_t len;
	        len = 8;
	        u16_t loop_length = 4;
	        int i = 0;
	        for(; i < loop_length; i += 1) {
	          getfsl(buffer[i], 0);//EXCEPTION_CONTROL_ATOMIC);
	        fsl_isinvalid(validity);
	        fsl_iserror(errority);
	        }

	    buffer[loop_length] = '\n';
	    i += 1;

	    //tcp_write(tpcb, payload, len , 1);
	    int len2 = (p -> len) >> 2;
	    for(; i < loop_length + len2 + 1; i += 1 ) {
	        putfslx(p->payload , 1, FSL_NONBLOCKING);
	        validity = 1;
	        fsl_isinvalid(validity);
	                fsl_iserror(errority);
	        getfslx(buffer[i], 1, FSL_NONBLOCKING);
	        validity = 1;
	        fsl_isinvalid(validity);
	        fsl_iserror(errority);
	    }
	    buffer[i] = '\n';
	    tcp_write(tpcb, payload, loop_length  + len2 + 2, 1);

        putfsl(p->payload, 2);
//	        putfslx(p->payload, 2, FSL_NONBLOCKING);
//	        validity = 0;
//	        getfslx(buffer[i + 1], 2, FSL_NONBLOCKING);
//
//	        fsl_isinvalid(validity);
//	        fsl_iserror(errority);
//
//	        buffer[i + 2] = '\n';
//	//
//	//      if(validity == 0) {
//	                tcp_write(tpcb, payload , i + 3, 1);
//	//      }

	pbuf_free(p);

	return ERR_OK;

}

err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	static int connection = 1;

	/* set the receive callback for this connection */
	tcp_recv(newpcb, recv_callback);

	/* just use an integer number indicating the connection id as the
	   callback argument */
	tcp_arg(newpcb, (void*)(UINTPTR)connection);

	/* increment for subsequent accepted connections */
	connection++;

	return ERR_OK;
}


int start_application()
{
	struct tcp_pcb *pcb;
	err_t err;
	unsigned port = 7;


	/* create new TCP PCB structure */
	pcb = tcp_new_ip_type(IPADDR_TYPE_ANY);
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind to specified @port */
	err = tcp_bind(pcb, IP_ANY_TYPE, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}

	/* we do not need any arguments to callback functions */
	tcp_arg(pcb, NULL);

	/* listen for connections */
	pcb = tcp_listen(pcb);
	if (!pcb) {
		xil_printf("Out of memory while tcp_listen\n\r");
		return -3;
	}

	/* specify callback to use for incoming connections */
	tcp_accept(pcb, accept_callback);

	xil_printf("TCP echo server started @ port %d\n\r", port);


	// set global pcb
	global_pcb = pcb;
	// repeatedly attempt to send, this will force this function to not return
//	char buffer [32];
//	volatile void * payload = buffer;
//		int validity;
//		int errority;
	//	for(int i = 0; i < p->len; i += 1 ) {
	//		putfslx(p->payload + i*4, 1, FSL_DEFAULT); //putfslx(p->payload + i*4, 1, FSL_NONBLOCKING);

//	while(1) {

//	    error = mfmsr();
//	    error &= ~0x10;
//	    mtmstr(error);
//
//	}
//	for(int i = 0; i < 32; i += 1) {
//		buffer[i] = i + 40;
//	}
//    int len = 4; //4 BYTES
//	int validity;
//	int errority;

//	while(1) {
//		for(int i = 0; i < len; i += 1 ) {
//				putfslx(p->payload + i*4, 1, FSL_DEFAULT); //putfslx(p->payload + i*4, 1, FSL_NONBLOCKING);
//
//				fsl_iserror(errority);
//				getfslx(buffer[i], 1, FSL_NONBLOCKING_EXCEPTION_CONTROL_ATOMIC); //getfslx(buffer[i], 1, FSL_NONBLOCKING);
//		}
//		getfslx(buffer[i], 1, FSL_NONBLOCKING_EXCEPTION_CONTROL_ATOMIC);
//		fsl_isinvalid(validity);
//		if(validity) {
//		tcp_write(pcb,payload, len, 1);
//		}
//	}
	return 0;
}
