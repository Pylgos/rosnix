{
  ament-cmake-ros,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tcb-span,
}:
buildCmakePackage (finalAttrs: {
  pname = "rsl";
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."rsl";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" ]; };
  propagatedNativeBuildInputs = [ rclcpp tcb-span ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "fmt" "libexpected-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "doxygen" ]; };
  propagatedBuildInputs = [ rclcpp tcb-span ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" "libexpected-dev" ]; };
  checkInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" "git" "range-v3" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rsl" = substituteSource {
      src = fetchgit {
        name = "rsl-source";
        url = "https://github.com/ros2-gbp/RSL-release.git";
        rev = "430e63f89e7087b53a1b5389af2f4aacb9cf90e3";
        hash = "sha256-2PMYD8/FW80lSwmGmZUzlcThrBg4YthYGry7qrxo8P8=";
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
