{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libros-bridge,
  mrpt-libtclap,
  mrpt-msgs,
  nav-msgs,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_rawlog";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."mrpt_rawlog";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  propagatedBuildInputs = [ cv-bridge mrpt-libros-bridge mrpt-libtclap mrpt-msgs nav-msgs rosbag2-cpp sensor-msgs tf2-geometry-msgs tf2-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_rawlog" = substituteSource {
      src = fetchgit {
        name = "mrpt_rawlog-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "f5dd347c42c5216c67ea30a249ecbc8227a7cc29";
        hash = "sha256-j4TYpawndaYvtwsh9HyR+MXbwpDgZ9LdVzZ0tM2Gg3E=";
      };
    };
  });
  meta = {
    description = "Nodes and programs to record and play MRPT rawlogs or to transform between rosbags and rawlogs.";
  };
})
