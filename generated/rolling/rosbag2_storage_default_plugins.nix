{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosbag2_storage_mcap,
  rosbag2_storage_sqlite3,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_storage_default_plugins = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_default_plugins-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "c6be948ed2c3e08c153102e5f0136acdd91744cc";
        hash = "sha256-qYKofx+YsiUi5fB0miblbrQfohN2A1NR/n3CxeRQ2yM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_default_plugins";
  version = "0.29.0-1";
  src = sources.rosbag2_storage_default_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosbag2_storage_mcap rosbag2_storage_sqlite3 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Intermediate metapackage to point at default storage plugin(s) for rosbag2";
  };
}
