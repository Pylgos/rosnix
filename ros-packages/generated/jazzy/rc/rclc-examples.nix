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
  version = "6.1.2-1";
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
        rev = "eb4fcbf5517ed4a020b0d34e57963bc6e94e2d46";
        hash = "sha256-kNMq9XiplXL4XVRKLed2WBksmArKPvf1mRAJ0cAzMuM=";
      };
    };
  });
  meta = {
    description = "Example of using rclc_executor";
  };
})
