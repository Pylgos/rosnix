{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gtest,
  ament-cmake-pep257,
  ament-cmake-pytest,
  ament-cmake-uncrustify,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  jrl-cmakemodules,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-eigen,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "linear_feedback_controller_msgs";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."linear_feedback_controller_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs jrl-cmakemodules rosidl-default-runtime sensor-msgs std-msgs tf2-eigen ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs jrl-cmakemodules rosidl-default-runtime sensor-msgs std-msgs tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-gtest ament-cmake-pep257 ament-cmake-pytest ament-cmake-uncrustify ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "linear_feedback_controller_msgs" = substituteSource {
      src = fetchgit {
        name = "linear_feedback_controller_msgs-source";
        url = "https://github.com/ros2-gbp/linear-feedback-controller-msgs-release.git";
        rev = "a029c1b0f367697eb77b14ad2550c0ffc27f77cf";
        hash = "sha256-yBJwg6xk6ri9dDV0lTLsRYDA+j5Kl7avee0mREyT8so=";
      };
    };
  });
  meta = {
    description = "\n    ROS msgs that interface the linear_feedback_controller package.\n  ";
  };
})
