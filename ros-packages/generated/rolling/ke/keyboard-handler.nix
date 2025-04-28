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
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."keyboard_handler";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "keyboard_handler" = substituteSource {
      src = fetchgit {
        name = "keyboard_handler-source";
        url = "https://github.com/ros2-gbp/keyboard_handler-release.git";
        rev = "5004e5e209d0c84700f9715e1d3ba9485dc203af";
        hash = "sha256-6tvwcFUeKhDHkttVLRn2f8H9Ja0atQKHvhzgf7M6mhE=";
      };
    };
  });
  meta = {
    description = "Handler for input from keyboard";
  };
})
