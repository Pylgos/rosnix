{
  ament_cmake_gmock,
  ament_cmake_ros,
  ament_cmake_version,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  rcutils,
  rosSystemPackages,
  rosidl_dynamic_typesupport,
  rosidl_runtime_c,
  substituteSource,
}:
let
  sources = rec {
    rmw = substituteSource {
      src = fetchgit {
        name = "rmw-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "785f02ef6ccd4c863ddb665f39498a854c14d0a3";
        hash = "sha256-ytGuQrW/Nt8ZX9IJPoGLQCbkrs/QPjZxskxKOD2rLtU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw";
  version = "7.3.1-1";
  src = sources.rmw;
  nativeBuildInputs = [ ament_cmake_ros ament_cmake_version ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcutils rosidl_dynamic_typesupport rosidl_runtime_c ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common osrf_testing_tools_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Contains the ROS middleware API.";
  };
}
