{
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-kernel,
  mrpt-libobs,
  mrpt-libros-bridge,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-msgs,
  tf2-ros,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_rosbag2";
  version = "1.5.1-1";
  src = finalAttrs.passthru.sources."mola_input_rosbag2";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ cv-bridge mola-kernel mrpt-libobs mrpt-libros-bridge rosbag2-cpp sensor-msgs tf2-geometry-msgs tf2-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_rosbag2" = substituteSource {
      src = fetchgit {
        name = "mola_input_rosbag2-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "40aee2d2e77ff4d9fda371d77ebd50aa57bdad92";
        hash = "sha256-PkZKB5W58c/ymUcYUnmDovmmNlxm9gC2pnSku5XTsWU=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from rosbag2 datasets";
  };
})
