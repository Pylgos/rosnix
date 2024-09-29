{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mavlink,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "libmavconn" = substituteSource {
      src = fetchgit {
        name = "libmavconn-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "b6360985c2e0b1561ea57a3feef7248b04a9d187";
        hash = "sha256-QBritO4WHraRumwSo3Zp7pZ16Sj5xlwZNFNpMxUNM3M=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "libmavconn";
  version = "2.8.0-1";
  src = sources."libmavconn";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mavlink ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" "libconsole-bridge-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "MAVLink communication library. This library provide unified connection handling classes and URL to connection object mapper. This library can be used in standalone programs.";
  };
}