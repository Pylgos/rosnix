{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_cbg_executor";
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_cbg_executor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_cbg_executor" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_cbg_executor-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "d6aa6e67b608588e6ca0a8da96dfbc199a51cae5";
        hash = "sha256-2Fzmd/dHrN4EvOCVENeVTz+q7rWCaQsDmtWKXUkKSIw=";
      };
    };
  });
  meta = {
    description = "Example for multiple Executor instances in one process, using the callback-group-level interface of the Executor class.";
  };
})
