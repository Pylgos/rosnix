{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "mouse_teleop";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."mouse_teleop";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ geometry-msgs rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tk" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "mouse_teleop" = substituteSource {
      src = fetchgit {
        name = "mouse_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "437f4604ab282b21368b706e859b43093fc32864";
        hash = "sha256-gRzPO+3HFvOz+Kix1qa6qYSlpD7AZbxACBgRSxPvpfw=";
      };
    };
  });
  meta = {
    description = "A mouse teleop tool for holonomic mobile robots.";
  };
})
