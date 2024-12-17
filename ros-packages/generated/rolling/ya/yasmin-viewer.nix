{
  ament-cmake,
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclpy,
  rosSystemPackages,
  substituteSource,
  yasmin,
  yasmin-msgs,
  yasmin-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_viewer";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."yasmin_viewer";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rclcpp rclpy yasmin yasmin-msgs yasmin-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-expiringdict" "python3-flask" "python3-waitress" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_viewer" = substituteSource {
      src = fetchgit {
        name = "yasmin_viewer-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "e0c2783441dba9ac3c69969cabe1e8fa33bfe49a";
        hash = "sha256-m/+LwSsvdBDFoOwD2HFiFZRJgWJIxxREJdZgicats3M=";
      };
    };
  });
  meta = {
    description = "TODO: Package description";
  };
})
