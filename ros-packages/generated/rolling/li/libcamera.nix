{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "libcamera" = substituteSource {
      src = fetchgit {
        name = "libcamera-source";
        url = "https://github.com/ros2-gbp/libcamera-release.git";
        rev = "5fb6283871df8fd6bbd838e3d4c0c29c409989db";
        hash = "sha256-n9KoBuogQR8eKpZN89hIiJv2ODG6tBQ5RdvmNzNi/4o=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "libcamera";
  version = "0.3.2-1";
  src = sources."libcamera";
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
