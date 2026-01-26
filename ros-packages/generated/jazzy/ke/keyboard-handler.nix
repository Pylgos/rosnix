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
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."keyboard_handler";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "keyboard_handler" = substituteSource {
      src = fetchgit {
        name = "keyboard_handler-source";
        url = "https://github.com/ros2-gbp/keyboard_handler-release.git";
        rev = "b95c105f98adc2b267fd0daf146d957941fdc48a";
        hash = "sha256-FTzy4WrPjzy2PhTRObZQ6X0jW//ZOqPSEagWAaAFYzo=";
      };
    };
  });
  meta = {
    description = "Handler for input from keyboard";
  };
})
