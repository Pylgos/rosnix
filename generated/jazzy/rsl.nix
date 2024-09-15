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
    fields2cover-vendor_source-or-tools-0-vendor_source-doxygen-awesome-20 = substituteSource {
      src = fetchurl {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-doxygen-awesome-20-source";
        url = "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
        hash = "sha256-HIlS9jhR+Ic9j73/EY/9nZG6QJEjsYFu59zTqNHlWHA=";
      };
      substitutions = [
      ];
    };
    rsl = substituteSource {
      src = fetchgit {
        name = "rsl-source";
        url = "https://github.com/ros2-gbp/RSL-release.git";
        rev = "c14d264098040784eb396e61c4d6a6ecdb0896cd";
        hash = "sha256-E8+8s6cFca2isl5g5q2OD85VomBeUfxjFIb3we5RUTA=";
      };
      substitutions = [
        {
          path = "docs/CMakeLists.txt";
          from = "DOWNLOAD\n     https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${fields2cover-vendor_source-or-tools-0-vendor_source-doxygen-awesome-20}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "rsl";
  version = "1.1.0-3";
  src = sources.rsl;
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
