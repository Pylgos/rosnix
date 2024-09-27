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
    tracetools-205bfd617e249f1c3ba2bd145a7f34c652e9ccd2 = substituteSource {
      src = fetchgit {
        name = "tracetools-205bfd617e249f1c3ba2bd145a7f34c652e9ccd2-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "205bfd617e249f1c3ba2bd145a7f34c652e9ccd2";
        hash = "sha256-ZD9KMKxTs31H4UCBDAFj81/ww7J3YUjz36CrbRGw4Bg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools";
  version = "8.3.0-1";
  src = sources.tracetools-205bfd617e249f1c3ba2bd145a7f34c652e9ccd2;
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
