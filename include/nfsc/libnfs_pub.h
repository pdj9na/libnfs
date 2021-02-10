#pragma once

#include <pthread.h>

struct nfs_context_pub{
	/* Only one thread at a time can enter libnfs */
	//pthread_mutex_t nfs_mutex;
};
