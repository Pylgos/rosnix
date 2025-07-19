{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "twist_stamper";
  version = "0.0.5-2";
  src = finalAttrs.passthru.sources."twist_stamper";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy std-msgs ];
  propagatedBuildInputs = [ geometry-msgs rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "twist_stamper" = substituteSource {
      src = fetchgit {
        name = "twist_stamper-source";
        url = "https://github.com/ros2-gbp/twist_stamper-release.git";
        rev = "f4ee9998fc84ca803976cef5c13ed270fb539e97";
        hash = "sha256-GUWWQcNLlgDez65Loqdfe/lgdkjUu2ZwDp91WEh8Hus=";
      };
    };
  });
  meta = {
    description = "ROS2 package for converting between Twist and TwistStamped messages";
  };
})
