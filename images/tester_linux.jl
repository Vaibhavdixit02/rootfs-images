## This rootfs does not include the compiler toolchain.

include(joinpath(dirname(@__DIR__), "rootfs_utils.jl"))
arch, = parse_args(ARGS)
image = "$(splitext(basename(@__FILE__))[1]).$(arch)"

# Build debian-based image with the following extra packages:
packages = [
    "bash",
    "curl",
    "gdb",
    "vim",
]
tarball_path = debootstrap(arch, image; packages)

# Upload it
upload_rootfs_image_github_actions(tarball_path)
