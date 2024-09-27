{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    zmqpp-vendor_source-da73a138f290274cfd604b3f05a908956390a66e = substituteSource {
      src = fetchgit {
        name = "zmqpp-vendor_source-da73a138f290274cfd604b3f05a908956390a66e-source";
        url = "https://github.com/zeromq/zmqpp.git";
        rev = "da73a138f290274cfd604b3f05a908956390a66e";
        hash = "sha256-UZyJpBEOf/Ys+i2tiBTjv4PlM5fHjjNLWuGhpgcmYyM=";
      };
      substitutions = [
      ];
    };
    zmqpp_vendor-b0f21543a13623f4155fbfdc7f42b0e8083e6c1b = substituteSource {
      src = fetchgit {
        name = "zmqpp_vendor-b0f21543a13623f4155fbfdc7f42b0e8083e6c1b-source";
        url = "https://github.com/ros2-gbp/zmqpp_vendor-release.git";
        rev = "b0f21543a13623f4155fbfdc7f42b0e8083e6c1b";
        hash = "sha256-OHJpSJAua016kXvKxcD1ay55wprlXnqSL19uzz/el6w=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/zeromq/zmqpp.git";
          to = "URL ${zmqpp-vendor_source-da73a138f290274cfd604b3f05a908956390a66e}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "zmqpp_vendor";
  version = "0.0.2-4";
  src = sources.zmqpp_vendor-b0f21543a13623f4155fbfdc7f42b0e8083e6c1b;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libzmq3-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for zmqpp";
  };
}
