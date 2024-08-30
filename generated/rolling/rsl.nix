{
  buildRosPackage,
  clang,
  doxygen,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  git,
  rclcpp,
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
        rev = "0dbb90cb7e4473a01a5dd46b10f47fda3440942c";
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
  version = "1.1.0-2";
  src = sources.rsl;
  nativeBuildInputs = [ doxygen ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen fmt rclcpp tcb_span tl_expected ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ clang git ];
  missingDependencies = [ "range-v3" ];
  meta = {
    description = "ROS Support Library";
  };
}
