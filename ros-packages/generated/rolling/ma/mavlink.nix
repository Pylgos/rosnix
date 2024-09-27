{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mavlink-31ee30cca1dfb58f7dd100c83114e9a982fa462b = substituteSource {
      src = fetchgit {
        name = "mavlink-31ee30cca1dfb58f7dd100c83114e9a982fa462b-source";
        url = "https://github.com/ros2-gbp/mavlink-gbp-release.git";
        rev = "31ee30cca1dfb58f7dd100c83114e9a982fa462b";
        hash = "sha256-eMcLVGZW3EwpEMSzXTtwesNUPH1veBpJQRE0DEAaQC4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mavlink";
  version = "2024.6.6-1";
  src = sources.mavlink-31ee30cca1dfb58f7dd100c83114e9a982fa462b;
  nativeBuildInputs = [ ament_cmake ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-future" "python3-lxml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "MAVLink message marshaling library. This package provides C-headers and C++11 library for both 1.0 and 2.0 versions of protocol. For pymavlink use separate install via rosdep (python-pymavlink).";
  };
}
