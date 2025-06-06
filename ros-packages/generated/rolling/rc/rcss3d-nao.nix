{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nao-lola-command-msgs,
  nao-lola-sensor-msgs,
  rclcpp-components,
  rcss3d-agent,
  rcss3d-agent-msgs-to-soccer-interfaces,
  rosSystemPackages,
  sensor-msgs,
  soccer-vision-3d-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcss3d_nao";
  version = "1.2.0-2";
  src = finalAttrs.passthru.sources."rcss3d_nao";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nao-lola-command-msgs nao-lola-sensor-msgs rclcpp-components rcss3d-agent rcss3d-agent-msgs-to-soccer-interfaces sensor-msgs soccer-vision-3d-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nao-lola-command-msgs nao-lola-sensor-msgs rclcpp-components rcss3d-agent rcss3d-agent-msgs-to-soccer-interfaces sensor-msgs soccer-vision-3d-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcss3d_nao" = substituteSource {
      src = fetchgit {
        name = "rcss3d_nao-source";
        url = "https://github.com/ros2-gbp/rcss3d_nao-release.git";
        rev = "eca4398e014f5149e7dfddd70953dc5e0a3b260f";
        hash = "sha256-gDCJv4U5VGvPzE6+9SysE6xYUMNx7KGRawSEwZp7sVM=";
      };
    };
  });
  meta = {
    description = "An interface to SimSpark that uses interfaces used by a Nao robot";
  };
})
