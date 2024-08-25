{
  ament_cmake_gen_version_h,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lttng-tools,
  lttng-ust,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    tracetools = substituteSource {
      src = fetchgit {
        name = "tracetools-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "104e6fff7d00e77fa44ee75ce1a7f2539825a57f";
        hash = "sha256-i66LTM0n72UzAILrGIzm192MWomhPsgDwmWMyJJ7N4E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools";
  version = "8.2.1-1";
  src = sources.tracetools;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lttng-tools lttng-ust ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Tracing wrapper for ROS 2.";
  };
}
