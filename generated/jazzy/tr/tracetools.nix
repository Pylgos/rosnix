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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    tracetools-fdd540cbf8e465c0258cb732e3e121c5fd5f9a3f = substituteSource {
      src = fetchgit {
        name = "tracetools-fdd540cbf8e465c0258cb732e3e121c5fd5f9a3f-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "fdd540cbf8e465c0258cb732e3e121c5fd5f9a3f";
        hash = "sha256-7Q5l3XnsaRS3e00Mam1vFw9JGEA6Y1DWFMdVSfPgsL4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools";
  version = "8.2.2-1";
  src = sources.tracetools-fdd540cbf8e465c0258cb732e3e121c5fd5f9a3f;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ust-dev" "lttng-tools" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Tracing wrapper for ROS 2.";
  };
}
