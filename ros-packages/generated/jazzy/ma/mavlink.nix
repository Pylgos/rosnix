{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "mavlink" = substituteSource {
      src = fetchgit {
        name = "mavlink-source";
        url = "https://github.com/ros2-gbp/mavlink-gbp-release.git";
        rev = "1ebc30fddf3bc7bc55237f144a262f09f9240c90";
        hash = "sha256-eMcLVGZW3EwpEMSzXTtwesNUPH1veBpJQRE0DEAaQC4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mavlink";
  version = "2024.6.6-1";
  src = sources."mavlink";
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
