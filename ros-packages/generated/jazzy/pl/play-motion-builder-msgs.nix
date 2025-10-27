{
  action-msgs,
  ament-cmake,
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
  pname = "play_motion_builder_msgs";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."play_motion_builder_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "play_motion_builder_msgs" = substituteSource {
      src = fetchgit {
        name = "play_motion_builder_msgs-source";
        url = "https://github.com/ros2-gbp/play_motion_builder-release.git";
        rev = "2dd735a10c982a53eef91208b9570e5efe8e464f";
        hash = "sha256-OEfW0hA0KV62Np/exZMCtaWxo/QiBIzyLSxQyEqwuA8=";
      };
    };
  });
  meta = {
    description = "The play_motion_builder_msgs package";
  };
})
