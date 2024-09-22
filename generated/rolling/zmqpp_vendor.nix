{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    zmqpp_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "zmqpp_vendor-source";
        owner = "ros2-gbp";
        repo = "zmqpp_vendor-release";
        rev = "8dcd48cf56f1e1d5b526d4c21d6bcfda5a66c4b5";
        hash = "sha256-OHJpSJAua016kXvKxcD1ay55wprlXnqSL19uzz/el6w=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/zeromq/zmqpp.git";
          to = "URL ${zmqpp_vendor-vendor_source-zmqpp-0}";
        }
      ];
    };
    zmqpp_vendor-vendor_source-zmqpp-0 = substituteSource {
      src = fetchFromGitHub {
        name = "zmqpp_vendor-vendor_source-zmqpp-0-source";
        owner = "zeromq";
        repo = "zmqpp";
        rev = "da73a138f290274cfd604b3f05a908956390a66e";
        hash = "sha256-UZyJpBEOf/Ys+i2tiBTjv4PlM5fHjjNLWuGhpgcmYyM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zmqpp_vendor";
  version = "0.0.2-3";
  src = sources.zmqpp_vendor;
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
