{
  automatika-ros-sugar,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  kompass-interfaces,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "kompass";
  version = "0.4.1-1";
  src = finalAttrs.passthru.sources."kompass";
  propagatedNativeBuildInputs = [ automatika-ros-sugar kompass-interfaces ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pykdl" ]; };
  propagatedBuildInputs = [ automatika-ros-sugar kompass-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pykdl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kompass" = substituteSource {
      src = fetchgit {
        name = "kompass-source";
        url = "https://github.com/ros2-gbp/kompass-release.git";
        rev = "3b4acef77b29c214d4b4c5446d22a414c261a97b";
        hash = "sha256-TaVczLJSG96G7cbGH7jh8B28Ynz2JJg07zty1tAMz+A=";
      };
    };
  });
  meta = {
    description = "Kompass: Event-driven navigation system";
  };
})
