{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  can-msgs,
  dataspeed-can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosbag2-cpp,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dataspeed_can_tools";
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."dataspeed_can_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs dataspeed-can-msgs rclcpp rosbag2-cpp std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_tools" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_tools-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "aca7a1aa31f4e0c3bc9c9877d2a286b691009612";
        hash = "sha256-jd8Vs5LsDnpTmrB0EXhGyMUn78KIsfwHbxcT7oIoOHc=";
      };
    };
  });
  meta = {
    description = "CAN bus introspection";
  };
})
