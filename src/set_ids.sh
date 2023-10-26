# Sets the locations of the architecture-dependent programs
function set_ids(){
	local os="$(uname)"
	local arch="$(uname -m)"

	if [ "${os}" = "Darwin" ]; then
		if [ "${arch}" = "arm64" ]; then
			printf "macOS-arm64 (supported) detected\n"
			atuin_id="aarch64-apple-darwin"
			bottom_id="aarch64-apple-darwin"
			catimg_id="https://drive.google.com/file/d/1j8H5iq9rauS_04XMsTX7pqElf3JWQ9wC/view?usp=share_link"
			fastfetch_id="Darwin"
			goodls_id="darwin_amd64"
			micromamba_id="osx-arm64"
			nnn_id="https://drive.google.com/file/d/1jHGoOOdNk8KY_Y4UrIC97XxaIiarIFUw/view?usp=share_link"
			nvtop_id="https://drive.google.com/file/d/1w_97e2xsFGP459QouzzUQCR3iHkTwuxd/view?usp=share_link"
			rclone_id="osx-arm64"
		else
			printf "\x1b[1;31mmacOS-${arch} (unsupported) detected\x1b[0m\n" >& 2
			exit 2
		fi
	elif [ "${os}" = "Linux" ]; then
		if [ "${arch}" = "x86_64" ]; then
			printf "Linux-amd64 (supported) detected\n"
			atuin_id="x86_64-unknown-linux-gnu"
			bottom_id="x86_64-unknown-linux-gnu"
			catimg_id="https://drive.google.com/file/d/1qakNW2xoloMnol_oHHgPwNb8RZve6ihx/view?usp=share_link"
			fastfetch_id="Linux"
			goodls_id="linux_amd64"
			micromamba_id="linux-64"
			nnn_id="https://drive.google.com/file/d/12-B9YRYGGCJBkz--QVhcWBhzEH3b7gHZ/view?usp=share_link"
			nvtop_id="https://drive.google.com/file/d/1z0AxBFJNSUmOjwdOj6pIP0ypEGkLQdN7/view?usp=share_link"
			rclone_id="linux-amd64"
		else
			printf "\x1b[1;31mLinux-${arch} (unsupported) detected\x1b[0m\n" >& 2
			exit 2
		fi
	else
		printf "\x1b[1;31m${os} (unsupported) detected\x1b[0m\n" >& 2
		exit 1
	fi
}