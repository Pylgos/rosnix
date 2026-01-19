{
  ament-cmake,
  ament-cmake-gtest,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_satellite";
  version = "4.3.1-1";
  src = finalAttrs.passthru.sources."rviz_satellite";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles rclcpp rcpputils rviz-common rviz-default-plugins sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "proj" "qt6-base-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles rclcpp rcpputils rviz-common rviz-default-plugins sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "proj" "qt6-base-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_satellite" = substituteSource {
      src = fetchgit {
        name = "rviz_satellite-source";
        url = "https://github.com/nobleo/rviz_satellite-release.git";
        rev = "78e1ffeca816a9ef9146f32127c5f7fe67004ef1";
        hash = "sha256-tXfzD2HMLgxc+BeizGOYj4DZqmilka4adJzpjy5PRzU=";
      };
    };
  });
  meta = {
    description = "Display satellite map tiles in RViz";
  };
})
