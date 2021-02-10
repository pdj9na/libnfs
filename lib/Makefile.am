AM_CFLAGS=$(WARN_CFLAGS)

lib_LTLIBRARIES = libnfs.la

libnfs_la_CPPFLAGS = -I$(top_srcdir)/include \
		     -I$(top_srcdir)/include \
		     -I$(top_srcdir)/mount \
		     -I$(top_srcdir)/nfs \
		     -I$(top_srcdir)/nfs4 \
		     -I$(top_srcdir)/nlm \
		     -I$(top_srcdir)/nsm \
		     -I$(top_srcdir)/portmap \
		     -I$(top_srcdir)/rquota \
		     -I$(top_srcdir)/win32 \
		     "-D_U_=__attribute__((unused))"

libnfs_la_SOURCES = \
	init.c \
	libnfs.c \
	libnfs-sync.c \
	libnfs-zdr.c \
	nfs_v3.c \
	nfs_v4.c \
	pdu.c \
	socket.c \
	../win32/win32_compat.c

SOCURRENT=13
SOREVISION=0
SOAGE=0
libnfs_la_LDFLAGS = -version-info $(SOCURRENT):$(SOREVISION):$(SOAGE)
libnfs_la_LIBADD = \
	../mount/libmount.la \
	../nfs/libnfs.la \
	../nfs4/libnfs4.la \
	../nlm/libnlm.la \
	../nsm/libnsm.la \
	../portmap/libportmap.la \
	../rquota/librquota.la 

