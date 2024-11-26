{
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
  version = "1.1.0-2";
  src = finalAttrs.passthru.sources."rsl";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" ]; };
  propagatedBuildInputs = [ rclcpp tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" "git" "range-v3" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rsl" = substituteSource {
        src = fetchgit {
          name = "rsl-source";
          url = "https://github.com/ros2-gbp/RSL-release.git";
          rev = "0dbb90cb7e4473a01a5dd46b10f47fda3440942c";
          hash = "sha256-E8+8s6cFca2isl5g5q2OD85VomBeUfxjFIb3we5RUTA=";
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
  };
  meta = {
    description = "ROS Support Library";
  };
})
