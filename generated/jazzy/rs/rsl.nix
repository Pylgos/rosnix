{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tcb_span,
  tl_expected,
}:
let
  sources = rec {
    doxygen-awesome-vendor_source-0w2qwp8silywwxp83c93j50bm4cxzn7i3zxxiwyqgy2i73v5528w = substituteSource {
      src = fetchurl {
        name = "doxygen-awesome-vendor_source-0w2qwp8silywwxp83c93j50bm4cxzn7i3zxxiwyqgy2i73v5528w-source";
        url = "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
        hash = "sha256-HIlS9jhR+Ic9j73/EY/9nZG6QJEjsYFu59zTqNHlWHA=";
      };
      substitutions = [
      ];
    };
    rsl-c14d264098040784eb396e61c4d6a6ecdb0896cd = substituteSource {
      src = fetchgit {
        name = "rsl-c14d264098040784eb396e61c4d6a6ecdb0896cd-source";
        url = "https://github.com/ros2-gbp/RSL-release.git";
        rev = "c14d264098040784eb396e61c4d6a6ecdb0896cd";
        hash = "sha256-E8+8s6cFca2isl5g5q2OD85VomBeUfxjFIb3we5RUTA=";
      };
      substitutions = [
        {
          path = "docs/CMakeLists.txt";
          from = "DOWNLOAD\n     https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${doxygen-awesome-vendor_source-0w2qwp8silywwxp83c93j50bm4cxzn7i3zxxiwyqgy2i73v5528w}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "rsl";
  version = "1.1.0-3";
  src = sources.rsl-c14d264098040784eb396e61c4d6a6ecdb0896cd;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp tcb_span tl_expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" "git" "range-v3" ]; };
  meta = {
    description = "ROS Support Library";
  };
}
