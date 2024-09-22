{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    libcamera = substituteSource {
      src = fetchgit {
        name = "libcamera-source";
        url = "https://github.com/ros2-gbp/libcamera-release.git";
        rev = "2220c34729e9a5fb612e4ddf39b1d1ef93189da9";
        hash = "sha256-45FJe28lkXjPLXx7svI8U6QCJq7Hocx9wRZuVz7iGoY=";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "meson" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "python3-jinja2" "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libatomic" "libssl-dev" "libudev-dev" "openssl" "pybind11-dev" "python3" "python3-ply" "yaml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "An open source camera stack and framework for Linux, Android, and ChromeOS";
  };
}
