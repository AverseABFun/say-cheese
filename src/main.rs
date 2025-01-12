#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[no_mangle]
pub unsafe extern "C" fn _start() -> ! {
    syscalls::syscall!(syscalls::x86_64::Sysno::write, 1, b"Hello, world!\n".as_ptr(), b"Hello, world!\n".len()).unwrap();
    syscalls::syscall!(syscalls::x86_64::Sysno::exit, 0).unwrap();
    unreachable!();
}

#[panic_handler]
unsafe fn panic_handler(_: &PanicInfo<'_>) -> ! {
    loop {}
}