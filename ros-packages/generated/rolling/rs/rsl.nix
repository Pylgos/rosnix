{
  ament-cmake-ros,
  buildCatkinPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tcb-span,
  tl-expected,
}:
buildCatkinPackage (finalAttrs: {
  pname = "rsl";
  version = "1.2.0-2";
  src = finalAttrs.passthru.sources."rsl";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" ]; };
  propagatedNativeBuildInputs = [ rclcpp tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "fmt" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "doxygen" ]; };
  propagatedBuildInputs = [ rclcpp tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" ]; };
  checkInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" "git" "range-v3" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rsl" = substituteSource {
      src = fetchgit {
        name = "rsl-source";
        url = "https://github.com/ros2-gbp/RSL-release.git";
        rev = "8cd41adcff383ec502ebf5de246c899a56156443";
        hash = "sha256-QflPGWqLZXn/cfdkOY10+R2bLpaxxbgQQp6NrN4ZcFM=";
      };
      substitutions = [
        {
          path = "docs/CMakeLists.txt";
          from = "DOWNLOAD\n     https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${sources."rsl/doxygen-awesome"}";
        }
      ];
    };
    "rsl/doxygen-awesome" = substituteSource {
      src = fetchurl {
        name = "doxygen-awesome-source";
        url = "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
        hash = "sha256-HIlS9jhR+Ic9j73/EY/9nZG6QJEjsYFu59zTqNHlWHA=";
      };
    };
  });
  meta = {
    description = "ROS Support Library";
  };
})
