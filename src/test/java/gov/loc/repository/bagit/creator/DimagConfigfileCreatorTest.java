package gov.loc.repository.bagit.creator;

import de.dit.api.dimag.controlfile.ControlfileController;
import de.dit.api.dimag.controlfile.VerzObjExtended;
import de.dit.api.dimag.controlfile.extended.types.VerzeichnungseinheitExtended;
import gov.loc.repository.bagit.TempFolderTest;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Path;
import java.security.NoSuchAlgorithmException;

public class DimagConfigfileCreatorTest extends TempFolderTest {

    @Test
    public void testCreateFile() throws IOException, NoSuchAlgorithmException {
        Path testFolder = createDirectory("someFolder");

        ControlfileController controlfileController = new ControlfileController();
        VerzeichnungseinheitExtended verz = new VerzeichnungseinheitExtended();
        VerzObjExtended obj = new VerzObjExtended();
        VerzObjExtended child = new VerzObjExtended();
        child.setDateiname("test.xml");
        obj.setAid("");
        obj.setAbgebendeStelle("Räuber Hotzenplotz");
        obj.getVerzObj().add(child);
        verz.getVerzObj().add(obj);


        System.out.println(controlfileController.getAsXml(verz));
    }

}
