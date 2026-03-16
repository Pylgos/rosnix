{
  ament-cmake-ros,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rcl,
  rclc,
  rclc-lifecycle,
  rclc-parameter,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclc_examples";
  version = "6.3.0-1";
  src = finalAttrs.passthru.sources."rclc_examples";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ example-interfaces lifecycle-msgs rcl rclc rclc-lifecycle rclc-parameter std-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ example-interfaces lifecycle-msgs rcl rclc rclc-lifecycle rclc-parameter std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclc_examples" = substituteSource {
      src = fetchgit {
        name = "rclc_examples-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "8be7dcc8d0088b22cd1c7ade9af631a3022a6631";
        hash = "sha256-1Pw2Vt+rsU3uYDZkFNsk7mU+02mAXY1i9coUj5ktHfQ=";
      };
    };
  });
  meta = {
    description = "Example of using rclc_executor";
  };
})
