#![no_std]
#![no_main]

#[allow(dead_code)]
const STDIN: usize = 0;

#[allow(dead_code)]
const STDOUT: usize = 1;

#[allow(dead_code)]
const STDERR: usize = 2;

use core::panic::PanicInfo;

unsafe fn write(fd: usize, s: &[u8]) -> Result<usize, syscalls::Errno> {
    syscalls::syscall!(syscalls::x86_64::Sysno::write, fd, s.as_ptr(), s.len())
}

unsafe fn exit(n: usize) -> ! {
    syscalls::syscall!(syscalls::x86_64::Sysno::exit, n).unwrap();
    unreachable!();
}

#[no_mangle]
pub unsafe extern "C" fn _start() -> ! {
    write(STDOUT, b"Hello, world!\n").unwrap();
    exit(0);
}

#[panic_handler]
unsafe fn panic_handler(_: &PanicInfo<'_>) -> ! { // do not mess with PanicInfo, it massively increases the size of the binary
    write(STDERR, b"Panic!\n").unwrap();
    exit(1);
}