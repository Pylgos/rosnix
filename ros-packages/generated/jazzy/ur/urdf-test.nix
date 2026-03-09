{
  ament-cmake-auto,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urdf_test";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."urdf_test";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liburdfdom-tools" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-tools" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch xacro ];
  passthru.sources = mkSourceSet (sources: {
    "urdf_test" = substituteSource {
      src = fetchgit {
        name = "urdf_test-source";
        url = "https://github.com/pal-gbp/urdf_test-ros2-gbp.git";
        rev = "d2a01837719e695956f7a64e47dd972b9d32e56c";
        hash = "sha256-yWY6dmjF0apCcxIks7hS6yoaypTZoCTzuhy95waaqnQ=";
      };
    };
  });
  meta = {
    description = "The urdf_test package";
  };
})
