{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    fastrtps_cmake_module = substituteSource {
      src = fetchgit {
        name = "fastrtps_cmake_module-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "25c45d3539dc60db9dd544f403adf606798cd8cc";
        hash = "sha256-bCoNsGJXFR/5/QRx4p3MDQUZaSGsHe7JpKSpUGSSE6Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fastrtps_cmake_module";
  version = "3.7.0-1";
  src = sources.fastrtps_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Provide CMake module to find eProsima FastRTPS.";
  };
}
