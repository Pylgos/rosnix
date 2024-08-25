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
        rev = "36cf9b0271157bf8f921cab16c9eab7c76efa10f";
        hash = "sha256-3XqLNpmlG8c2wmvkMyKGMiB4EuGT1m/SOhLqtot+2kQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_default_plugins";
  version = "0.28.0-1";
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
