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
  version = "0.6.0-1";
  src = finalAttrs.passthru.sources."keyboard_handler";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "keyboard_handler" = substituteSource {
      src = fetchgit {
        name = "keyboard_handler-source";
        url = "https://github.com/ros2-gbp/keyboard_handler-release.git";
        rev = "8a93d77d335b5865d7ae2fb2d5992d646160f3a6";
        hash = "sha256-sLdc6OGNdKHbyDGE/TLws72wgRcRHE2Y3+8FrkMav/o=";
      };
    };
  });
  meta = {
    description = "Handler for input from keyboard";
  };
})
