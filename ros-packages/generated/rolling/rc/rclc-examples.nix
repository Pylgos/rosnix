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
  version = "6.2.0-1";
  src = finalAttrs.passthru.sources."rclc_examples";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl ];
  propagatedBuildInputs = [ example-interfaces lifecycle-msgs rclc rclc-lifecycle rclc-parameter std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclc_examples" = substituteSource {
      src = fetchgit {
        name = "rclc_examples-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "c91af81f6642d783126c29f37983b57dd5be7785";
        hash = "sha256-SC9LbRxorM55xg8sK9pDm235fnw5UvYahla7aUvq7e0=";
      };
    };
  });
  meta = {
    description = "Example of using rclc_executor";
  };
})
