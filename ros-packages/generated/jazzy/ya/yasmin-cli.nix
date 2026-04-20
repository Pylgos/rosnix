{
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  ros2cli,
  rosSystemPackages,
  substituteSource,
  yasmin,
  yasmin-factory,
  yasmin-plugins-manager,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "yasmin_cli";
  version = "5.0.0-2";
  src = finalAttrs.passthru.sources."yasmin_cli";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2cli yasmin yasmin-factory yasmin-plugins-manager ];
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli yasmin yasmin-factory yasmin-plugins-manager ];
  passthru.sources = mkSourceSet (sources: {
    "yasmin_cli" = substituteSource {
      src = fetchgit {
        name = "yasmin_cli-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "95231a8de7b9300e46b2eba64bacc048cbbf8a5c";
        hash = "sha256-uyxPRFt2HZMajDficGBxpHqwXbY9l2zUrkZOBgLipFY=";
      };
    };
  });
  meta = {
    description = "CLI tools for inspecting YASMIN states and metadata.";
  };
})
