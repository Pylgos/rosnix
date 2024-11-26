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
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."keyboard_handler";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "keyboard_handler" = substituteSource {
        src = fetchgit {
          name = "keyboard_handler-source";
          url = "https://github.com/ros2-gbp/keyboard_handler-release.git";
          rev = "5518cbbb786b7a6d0ef4d1406544c7ac4fdf3c31";
          hash = "sha256-cM1eIpQQsH6YmfL/vj9FuQEkNSQ8xU2Cbn0Uv68rTN8=";
        };
      };
    });
  };
  meta = {
    description = "Handler for input from keyboard";
  };
})
