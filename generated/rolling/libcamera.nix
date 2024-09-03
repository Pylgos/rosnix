{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libyaml,
  openssl,
  pkg-config,
  python3,
  python3Packages,
  substituteSource,
  udev,
}:
let
  sources = rec {
    libcamera = substituteSource {
      src = fetchgit {
        name = "libcamera-source";
        url = "https://github.com/ros2-gbp/libcamera-release.git";
        rev = "c29abe77af63aad8ad5de183f57bcb63f0ec279c";
        hash = "sha256-SjadIxWIvJfyF9O00K2HG8qcFKwyRukB8or93Leirvw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libcamera";
  version = "0.3.1-4";
  src = sources.libcamera;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ pkg-config buildPackages.python3Packages.jinja2 buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyaml openssl python3 python3Packages.pybind11 udev ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "meson" "python3-ply" ];
  meta = {
    description = "An open source camera stack and framework for Linux, Android, and ChromeOS";
  };
}
