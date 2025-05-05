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
  version = "6.1.0-3";
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
        rev = "c337bef2b8518d838a103f525de33bab614c50ab";
        hash = "sha256-oGcnLCr8skjywWIh93EYKzbeJaXxJpnHiJB2rbxQjSI=";
      };
    };
  });
  meta = {
    description = "Example of using rclc_executor";
  };
})
