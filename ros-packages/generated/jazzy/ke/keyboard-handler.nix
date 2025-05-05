{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "keyboard_handler";
  version = "0.3.1-2";
  src = finalAttrs.passthru.sources."keyboard_handler";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "keyboard_handler" = substituteSource {
      src = fetchgit {
        name = "keyboard_handler-source";
        url = "https://github.com/ros2-gbp/keyboard_handler-release.git";
        rev = "69c6f6299fa48d6a45e44fbdb040e4dc0fae1423";
        hash = "sha256-MrlcTu+x6mBfTXFBvem82OYZkmwmdCO51eLno3SvoY8=";
      };
    };
  });
  meta = {
    description = "Handler for input from keyboard";
  };
})
