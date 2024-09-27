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
    zmqpp_vendor-8dcd48cf56f1e1d5b526d4c21d6bcfda5a66c4b5 = substituteSource {
      src = fetchgit {
        name = "zmqpp_vendor-8dcd48cf56f1e1d5b526d4c21d6bcfda5a66c4b5-source";
        url = "https://github.com/ros2-gbp/zmqpp_vendor-release.git";
        rev = "8dcd48cf56f1e1d5b526d4c21d6bcfda5a66c4b5";
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
  version = "0.0.2-3";
  src = sources.zmqpp_vendor-8dcd48cf56f1e1d5b526d4c21d6bcfda5a66c4b5;
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
