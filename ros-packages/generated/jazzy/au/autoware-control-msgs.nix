{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_control_msgs";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_control_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_control_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_control_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "1d1e205e6b49b49d4f5854fe633c002cf9bf48d0";
        hash = "sha256-YGiBXCxAzgRFewA7Z11Rk606ef+Q0iT+ckMKo0Wj9G8=";
      };
    };
  });
  meta = {
    description = "Autoware control messages package.";
  };
})
