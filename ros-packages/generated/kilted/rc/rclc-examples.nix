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
  version = "6.2.3-1";
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
        rev = "1ce03bccae4f47a60598821837f6a3dbcfe7c24d";
        hash = "sha256-kM/K4f01u22tH5O4DuUgsYMoahwS08SLnkBxaxw3iwM=";
      };
    };
  });
  meta = {
    description = "Example of using rclc_executor";
  };
})
